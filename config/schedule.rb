# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# ログの出力先
set :output, "log/cron_log.log"

# 実行環境セット
ENV['RAILS_ENV'] ||= 'development'
set :environment, ENV['RAILS_ENV']

# 毎日1回'rails s3_bucket:cleanup'を実行させる
every 1.days do
  rake "s3_bucket:cleanup"
end
