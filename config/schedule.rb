set :output, "/home/web/apps/jshq/shared/log/cron.log"

every 1.hour do
  rake "solr:reindex"
end
