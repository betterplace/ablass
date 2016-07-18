if ENV['GC_PROFILING'].to_i == 1
  GC::Profiler.enable
else
  GC::Profiler.disable
end
