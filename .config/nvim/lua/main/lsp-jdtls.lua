local ok, jdtls = pcall(require, "jdtls")
if not ok then
    print("jdtls NOT ok")
    return
end

local home_dir = os.getenv("HOME")
local nvim_dir = home_dir .. "/.local/share/nvim"
local jdtls_dir = nvim_dir .. "/mason/packages/jdtls"
local config_dir = jdtls_dir .. "/config_mac"
local plugins_dir = jdtls_dir .. "/plugins"
local path_to_jar = plugins_dir .. "/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
local path_to_lombok = jdtls_dir .. "/lombok.jar"

local root_markers = {
    ".git",
    "build.xml"
}
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
    print("jdtls could not find root directory")
    return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = nvim_dir .. "/site/java/workspace-root/" .. project_name
os.execute("mkdir " .. workspace_dir)

local config = {
    log_level = vim.lsp.protocol.MessageType.Log,
    log_file = '/Users/danapar/jdtls.log',
    on_attach = M.on_attach,
    cmd = {
        '/usr/bin/java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocal=true',
        '-Dlog.level=ALL',
        '-javaagent:' .. path_to_lombok,
        '-Xmslg',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.long=ALL-UNNAMED',
        '-jar', path_to_jar,
        '-configuration', config_dir,
        '-data', workspace_dir,
    },
    root_dir = root_dir,
    settings = {
        java = {
            home = '/Library/Java/JavaVirtualMachines/jdk-17.jdk'
        },
        format = {
            enabled = false,
        },
        signatureHelp = {
            enabled = true,
        },
    }
}

jdtls.start_or_attach(config)
