-- Run only in an owned test process via smr-harness run-file.
-- Keeps the user's enabled-mod list intact on disk.
CreateRealTimeThread(function()
    ModsReloadDefs()
    rawset(_G, "MCPXNativePreviousLoadMods", table.copy(AccountStorage.LoadMods or {}))
    AccountStorage.LoadMods = table.copy(MCPXNativePreviousLoadMods)
    table.insert_unique(AccountStorage.LoadMods, "MouseCursorPs5Xbox")
    ProtectedModsReloadItems(nil, true)
    AccountStorage.LoadMods = MCPXNativePreviousLoadMods
    local mod = Mods.MouseCursorPs5Xbox
    local deadline = RealTime() + 10000
    while mod and not rawget(mod.env, "MCPX") and RealTime() < deadline do Sleep(100) end
    local m = mod and rawget(mod.env, "MCPX")
    local valid, reason
    if m then valid, reason = m.Validate() end
    rawset(_G, "MCPXNativeLoadReport", {
        mod_found = mod ~= nil,
        version = mod and mod.version,
        module_loaded = m ~= nil,
        input_registered = m and m.input ~= nil,
        validation_passed = valid == true,
        validation_reason = reason,
        load_errors = ModsLoadCodeErrorsMessage or false,
        ui_style = GetUIStyle(),
        revision = LuaRevision,
    })
end)
