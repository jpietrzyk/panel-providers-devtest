shared_context :target_groups do
  let(:target_group) { FactoryGirl.create(:target_group) }
  let(:country) do
    FactoryGirl.create(
      :country,
      panel_provider: target_group.panel_provider
    )
  end
end
