local lip = require("effi-nvim.LIP");

local M = {};

Data = {};
Job = 0;
ConfigPath = "";

Output = {};

local function file_exists(name)
   local f = io.open(name,"r")
   if f ~= nil then
     io.close(f)
     return true
   else
     return false
   end
end

function M.load()
  ConfigPath = vim.fn.getcwd() .. "/.effi";
  if not file_exists(ConfigPath) then
    print("Could not load project");
    return
  end
  Data = lip.load(ConfigPath);
  print("Loaded " .. Data["project"]["name"]);
end

function M.run()
  Output = {};
  vim.fn.jobstop(Job);
  Job = vim.fn.jobstart(
    Data["project"]["run"],
    {
      on_stdout = function (jobid, data, event)
        table.insert(Output, data[1]);
      end,
      on_stderr = function (jobid, data, event)
        table.insert(Output, data[1]);
      end,
      on_exit = function (jobid, data, event)
        print("Exited");
      end,
    }
  );
  print("Running");
end

function M.stop()
  vim.fn.jobstop(Job);
  print("Exited");
end

function M.print()
  for idx = 1, #Output, 1 do
    print(Output[idx]);
  end
end

return M;
