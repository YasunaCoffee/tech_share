namespace :s3_bucket do
  desc 'remove unattached files'
  task cleanup: :environment do
    ActiveStorage::Blob.unattached.find_each(&:purge)
  end
end
