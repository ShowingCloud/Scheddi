# This migration comes from refinery_scheddi_recommendations (originally 1)
class CreateScheddiRecommendationsScheddiRecommendations < ActiveRecord::Migration

  def up
    create_table :refinery_scheddi_recommendations do |t|
      t.string :name
      t.text :description
      t.integer :resource_id
      t.integer :image_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-scheddi_recommendations"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/scheddi_recommendations/scheddi_recommendations"})
    end

    drop_table :refinery_scheddi_recommendations

  end

end
