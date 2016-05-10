module Refinery
  module ScheddiRecommendations
    class ScheddiRecommendationsController < ::ApplicationController

      before_filter :find_all_scheddi_recommendations
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @scheddi_recommendation in the line below:
        present(@page)
      end

      def show
        @scheddi_recommendation = ScheddiRecommendation.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @scheddi_recommendation in the line below:
        present(@page)
      end

    protected

      def find_all_scheddi_recommendations
        @scheddi_recommendations = ScheddiRecommendation.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/scheddi_recommendations").first
      end

    end
  end
end
