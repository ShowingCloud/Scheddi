module Refinery
  module ScheddiRecommendations
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::ScheddiRecommendations

      engine_name :refinery_scheddi_recommendations

      initializer "register refinerycms_scheddi_recommendations plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "scheddi_recommendations"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.scheddi_recommendations_admin_scheddi_recommendations_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/scheddi_recommendations/scheddi_recommendation',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::ScheddiRecommendations)
      end
    end
  end
end
