local h = require("helpers")

local shavian_mapings = {
    q = "𐑶", Q = "𐑬",
    w = "𐑢", W = "𐑾",
    e = "𐑧", E = "𐑱",
    r = "𐑮", R = "𐑸",
    t = "𐑑", T = "𐑔",
    y = "𐑭", Y = "𐑷",
    u = "𐑳", U = "𐑫",
    i = "𐑦", I = "𐑰",
    o = "𐑪", O = "𐑴",
    p = "𐑐", P = "𐑹",
    a = "𐑩", A = "𐑨",
    s = "𐑕", S = "𐑖",
    d = "𐑛", D = "𐑽",
    f = "𐑓", F = "𐑲",
    g = "𐑜", G = "∙",
    h = "𐑣", H = "𐑞",
    j = "𐑘", J = "𐑡",
    k = "𐑒", K = "«",
    l = "𐑤", L = "»",
    z = "𐑟", Z = "𐑠",
    x = "𐑻", X = "𐑺",
    c = "𐑗", C = "𐑽",
    v = "𐑝", V = "𐑿",
    b = "𐑚", B = "∘",
    n = "𐑯", N = "𐑙",
    m = "𐑥", M = "𐑵",
}

h.g.shavian_mode_enabled = false

local function set_shavian()
    if h.g.shavian_mode_enabled then
        for key, value in pairs(shavian_mapings) do
            h.api.nvim_set_keymap("i", key, value, { noremap = true, silent = true })
        end
    end
end

local function reset_mappings()
    for key, _ in pairs(shavian_mapings) do
        h.api.nvim_del_keymap("i", key)
    end
end

local function toggle_shavian_mode()
    h.g.shavian_mode_enabled = not h.g.shavian_mode_enabled
end

h.api.nvim_create_user_command("ToggleShavianMode", toggle_shavian_mode, { desc = "Toggle Shavian mode" })

h.api.nvim_create_autocmd("InsertEnter", { callback = function()
    if h.g.shavian_mode_enabled then
        set_shavian()
    end
end })

h.api.nvim_create_autocmd("InsertLeave", { callback = function()
    if h.g.shavian_mode_enabled then
        reset_mappings()
    end
end })
