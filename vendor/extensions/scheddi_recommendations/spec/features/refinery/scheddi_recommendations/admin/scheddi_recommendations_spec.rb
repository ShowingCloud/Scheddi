# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "ScheddiRecommendations" do
    describe "Admin" do
      describe "scheddi_recommendations" do
        refinery_login_with :refinery_user

        describe "scheddi_recommendations list" do
          before do
            FactoryGirl.create(:scheddi_recommendation, :name => "UniqueTitleOne")
            FactoryGirl.create(:scheddi_recommendation, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.scheddi_recommendations_admin_scheddi_recommendations_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.scheddi_recommendations_admin_scheddi_recommendations_path

            click_link "Add New Scheddi Recommendation"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::ScheddiRecommendations::ScheddiRecommendation.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::ScheddiRecommendations::ScheddiRecommendation.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:scheddi_recommendation, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.scheddi_recommendations_admin_scheddi_recommendations_path

              click_link "Add New Scheddi Recommendation"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::ScheddiRecommendations::ScheddiRecommendation.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:scheddi_recommendation, :name => "A name") }

          it "should succeed" do
            visit refinery.scheddi_recommendations_admin_scheddi_recommendations_path

            within ".actions" do
              click_link "Edit this scheddi recommendation"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:scheddi_recommendation, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.scheddi_recommendations_admin_scheddi_recommendations_path

            click_link "Remove this scheddi recommendation forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::ScheddiRecommendations::ScheddiRecommendation.count.should == 0
          end
        end

      end
    end
  end
end
