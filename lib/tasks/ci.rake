namespace :ci do
  task :db_config
    cp "config/database.yml.ccontrol", "config/database.yml"
  end
  task :prepare => ["ci:db_config", "db:migrate"]
  task :deploy do
    cp "chouette2.war", "/var/lib/tomcat6/webapps/"
  end
  task :build => ["spec", "war", "ci:deploy"]
end

