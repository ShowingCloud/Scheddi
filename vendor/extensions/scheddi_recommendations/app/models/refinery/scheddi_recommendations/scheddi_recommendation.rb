module Refinery
  module ScheddiRecommendations
    class ScheddiRecommendation < Refinery::Core::BaseModel
      self.table_name = 'refinery_scheddi_recommendations'

      attr_accessible :name, :category, :description, :data_id, :picture_id, :position

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
