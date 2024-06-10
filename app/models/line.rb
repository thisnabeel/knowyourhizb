class Line < ActiveRecord::Base
  belongs_to :chapter

  def saveRecording(file)
    self.update(recording_url: Recorder.saveRecording(self, file))
  end
end
