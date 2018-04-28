Project.destroy_all
Post.destroy_all

10.times do |i|
  Project.create!(:name => Faker::Coffee.blend_name, :description => Faker::ChuckNorris.fact)
  @project_id = Project.last.id
  3.times do |i|
    Post.create!(:content => Faker::VForVendetta.quote, :rating => 5, :project_id => @project_id)
  end
end
