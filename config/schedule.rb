# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

set :output,"#{path}/log/cron.log"


every 20.days do
  rake "searchkick:reindex CLASS=Place"
  #rake "searchkick:reindex CLASS=User"
  rake "search_suggestions:reindex"
end

every 1.hour do
  command "rm -rf public/uploads/tmp/*"
end


every 20.days do
  runner "Newsletter.week_newsletter"
end