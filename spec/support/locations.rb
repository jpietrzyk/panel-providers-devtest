shared_context :locations do
  let(:country) { FactoryGirl.create(:country) }
  let(:location_group) do
    FactoryGirl.create(
      :location_group,
      locations: [FactoryGirl.create(:location)],
      panel_provider: country.panel_provider,
      country: country
    )
  end
end
