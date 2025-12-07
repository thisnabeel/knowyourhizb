class Piece < ActiveRecord::Base
    belongs_to :chapter


    before_destroy :delete_s3_object

    def saveRecording(file)
        file_name = "#{self.uuid}.mp3"
        

        Dir.mkdir("#{Rails.root}/tmp/raw") unless File.exists?("#{Rails.root}/tmp/raw")
        Dir.mkdir("#{Rails.root}/tmp/mp3") unless File.exists?("#{Rails.root}/tmp/mp3")
        
        of = "#{Rails.root}/tmp/raw/#{self.id.to_s + File.extname(file)}"
        nf =  "#{Rails.root}/tmp/mp3/#{self.id.to_s}.mp3"

        File.delete(of) if File.exist?(of)
        File.delete(nf) if File.exist?(nf)

        File.open(of, 'wb') do |f|
            f.write file.read
        end

        system "ffmpeg -i #{of} -vn -ab 128k -ar 44100 -y #{nf}"

        s3 = Aws::S3::Resource.new(region: ENV["AWS_REGION"] || 'us-east-1')
        obj = s3.bucket('knowyourhizb').object("pieces/#{file_name}")

        # Delete existing file if it exists
        begin
            obj.delete
            puts "deleted!"
        rescue Aws::S3::Errors::NoSuchKey
            # File doesn't exist, which is fine
        end

        puts "Uploading file #{file_name}"

        # Get the list of files in the folder
        file_list = Dir.glob("#{Rails.root}/tmp/raw/*")

        # Iterate over the file list and print the file names
        file_list.each do |file_path|
            file_name = File.basename(file_path)
            puts file_name
        end

        File.open(nf, 'rb') do |file|
            obj.upload_file(file, acl:'public-read')
            return obj.public_url
        end
    end

    def updateMp3
        require 'open-uri'
        Dir.mkdir("#{Rails.root}/tmp/raw") unless File.exists?("#{Rails.root}/tmp/raw")        
        of = "#{Rails.root}/tmp/raw/#{self.id.to_s}.mp3"
        File.delete(of) if File.exist?(of)
        IO.copy_stream(URI.open(self.recording), of)
        File.open(of, 'rb') do |file|
            self.update(recording: saveRecording(file))
        end
    end

	def delete_s3_object

        begin
            if self.recording.present?
                s3 = Aws::S3::Resource.new(region: ENV["AWS_REGION"] || 'us-east-1')
                # reference an existing bucket by name
                bucket = s3.bucket('knowyourhizb')

                key = self.recording.split('amazonaws.com/')[1]
                bucket.object(key).delete

                key = self.recording.split('amazonaws.com/')[1]
                bucket.object(key).delete

                puts "DELETED RECORDING!!!!"
            end
        rescue
        end
    
	end
end
