class Recorder < ActiveRecord::Base

    class << self
        def saveRecording(element, file)

            require 'aws-sdk'
            extension = "mp3"
            file_name = "#{element.id}.#{extension}"
            

            Dir.mkdir("#{Rails.root}/tmp/raw") unless File.exists?("#{Rails.root}/tmp/raw")
            Dir.mkdir("#{Rails.root}/tmp/#{extension}") unless File.exists?("#{Rails.root}/tmp/#{extension}")
            
            of = "#{Rails.root}/tmp/raw/#{element.id.to_s + File.extname(file)}"
            nf =  "#{Rails.root}/tmp/#{extension}/#{element.id.to_s}.#{extension}"

            File.delete(of) if File.exist?(of)
            File.delete(nf) if File.exist?(nf)

            File.open(of, 'wb') do |f|
                f.write file.read
            end

            system "ffmpeg -i #{of} -vn -ab 128k -ar 44100 -y #{nf}"

            s3 = Aws::S3::Resource.new

            obj = s3.bucket('knowyourhizb').object("#{element.class.name}/#{file_name}")

            bucket = s3.bucket('knowyourhizb')
            if obj.delete
                puts "deleted!"
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

        def updateMp3(element)
            require 'open-uri'
            Dir.mkdir("#{Rails.root}/tmp/raw") unless File.exists?("#{Rails.root}/tmp/raw")        
            of = "#{Rails.root}/tmp/raw/#{element.id.to_s}.mp3"
            File.delete(of) if File.exist?(of)
            IO.copy_stream(URI.open(element.recording_url), of)
            File.open(of, 'rb') do |file|
                element.update(recording: saveRecording(file))
            end
        end

        def delete_s3_object(url)

            begin
                if url.present?
                    s3 = Aws::S3::Resource.new
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
end
