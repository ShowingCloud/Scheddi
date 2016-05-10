module Refinery
  module ScheddiRecommendations
    module Admin
      class ScheddiRecommendationsController < ::Refinery::AdminController

        crudify :'refinery/scheddi_recommendations/scheddi_recommendation',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
