%% 需要把此文件copy 到ebin/ 文件名以.app 结尾
{application ,erlcount,
 [{vsn, "1.0.0"},                                                             %版本号
  {description, "count word in all erl files under some directory recursively."},
  {applications,[stdlib,kernel ,ppool]},
  {modules,[]}, %本 application内有哪些 module
  {registered,[]},                                                        %本 application内有哪些 register
  %%{mod, {CallbackMod, Args}} 回调module, application从何处启动，信息在此给出
  %%This tells OTP that when  starting your application, it should call CallbackMod:start(normal, Args).
  %%and  CallbackMod:stop(Args) for stop
  %%所以  ppool 模块内要有start/2 stop/1
  %% start/2 返回{ok, Pid} or {ok, Pid, SomeState}
  %%stop/1  takes the state returned by start/2 as an argument
  {mod,{erlcount,[]}},
  {env,
   [
    {directory , "."},
    {regex,["if","case"]},
    {max_files,10},
    {loglevel,info}                             %可取info 及debug 两值
   ]
  }
 ]
}
.
