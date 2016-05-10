
FactoryGirl.define do
  factory :scheddi_recommendation, :class => Refinery::ScheddiRecommendations::ScheddiRecommendation do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

