PanelProvider.destroy_all
Country.destroy_all
Location.destroy_all
LocationGroup.destroy_all
TargetGroup.destroy_all

3.times do |i|
  pp = PanelProvider.create!(
    code: "code-#{i}"
  )

  Country.create!(
    country_code: ('A'..'Z').to_a.sample(2).join,
    panel_provider: pp
  )
end

20.times do |i|
  Location.create!(
    name: Faker::Address.city,
    external_id: "loc-ext-id-#{i}",
    secret_code: "secret-code-#{i}"
  )
end

countries = [Country.first, Country.second, Country.third, Country.first]
4.times do |i|
  LocationGroup.create!(
    name: "Group name #{i}",
    country: countries[i],
    panel_provider: countries[i].panel_provider
  )
end

4.times do |i|
  tg = TargetGroup.create!(
    name: "Target Group #{i}",
    external_id: "tg-ext-id-#{i}",
    secret_code: "secret-code-#{i}",
    panel_provider: countries[i].panel_provider
  )

  sub = tg.children.create!(
    name: "Sub Target Group #{i}-#{i}",
    external_id: "tg-ext-id-#{i}-#{i}",
    secret_code: "secret-code-#{i}-#{i}",
    panel_provider: countries[i].panel_provider
  )

  sub.children.create!(
    name: "Sub Sub Target Group #{i}-#{i}-#{i}",
    external_id: "tg-ext-id-#{i}-#{i}-#{i}",
    secret_code: "secret-code-#{i}-#{i}-#{i}",
    panel_provider: countries[i].panel_provider
  )
end
