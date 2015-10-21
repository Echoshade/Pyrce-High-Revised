LagFilter
      var
            def = 75
            lagset = 0
            clag = 0
            tick_mem = 0
            sleep = 50

      New()
            tick_mem = world.tick_lag
            spawn()
                  Lag_Filter()

      proc/Lag_Filter()
            while(1)
                  if(lagset == 0)
                        if(world.cpu >= def)
                              world.tick_lag++
                              world.tick_lag = round(world.tick_lag)
                        if(world.cpu < def)
                              if(world.tick_lag == tick_mem)
                                    ..()
                              else
                                    world.tick_lag--
                                    world.tick_lag = round(world.tick_lag)
                  else
                        if(world.cpu >= clag)
                              world.tick_lag++
                              world.tick_lag = round(world.tick_lag)
                        if(world.cpu < clag)
                              if(world.tick_lag == tick_mem)
                                    ..()
                              else
                                    world.tick_lag--
                                    world.tick_lag = round(world.tick_lag)
                  sleep(sleep)



var/LagFilter/LagFilter = new()