-- init.lua

-- Get the directory of the current file (init.lua)
local script_dir = vim.fn.expand('<sfile>:p:h')

-- Function to load all .lua files from the current directory, excluding init.lua
local function load_lua_files_from_directory(directory)
    for _, file in ipairs(vim.fn.glob(directory .. '/*.lua', 0, 1)) do
        if file ~= script_dir .. '/init.lua' then  -- Exclude init.lua
            dofile(file)
        end
    end
end

-- Load all .lua files from the same directory
load_lua_files_from_directory(script_dir)
