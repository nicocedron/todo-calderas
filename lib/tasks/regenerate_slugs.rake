namespace :slugs do
  desc "Regenerate slugs for all posts"
  task regenerate: :environment do
    Post.find_each(&:save)
    puts "Slugs regenerated for all posts"
  end
end