class NarratorNarration < ActiveRecord::Base
    belongs_to :narrator
    belongs_to :narration
end
