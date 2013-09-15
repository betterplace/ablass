task :default => [ :'db:migrate', :'db:test:prepare', :spec ]
