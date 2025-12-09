class NarrationSource < ActiveRecord::Base
  belongs_to :narrator_narration
  belongs_to :source_narrator_narration, class_name: 'NarratorNarration', foreign_key: 'source_narrator_narration_id'
end

