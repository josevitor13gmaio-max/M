-- [[ FRED'S SMART LOADER - TESTADOR DE LINK DO JOSÉ ]]
local url = "https://raw.githubusercontent.com/josevitor13gmaio-max/Josem/refs/heads/main/Josehub.lua"

print("[Fred] Tentando conectar ao GitHub do José...")

-- 1. Tenta baixar o texto do link sem travar o executor
local sucessoDownload, codigoTexto = pcall(function()
    return game:HttpGet(url)
end)

if not sucessoDownload or not codigoTexto then
    warn("[Fred ERRO] Não consegui baixar o código! Verifique se a internet do celular caiu ou se o link está digitado errado.")
    return
end

-- Verifica se o arquivo no GitHub não está totalmente em branco
if codigoTexto == "" or codigoTexto == "404: Not Found" then
    warn("[Fred ERRO] O link respondeu, mas o arquivo está VAZIO ou deu erro 404 no GitHub! Dê uma olhada no seu repositório.")
    return
end

print("[Fred] Código baixado com sucesso! Compilando...")

-- 2. Tenta transformar o texto em um script rodável (loadstring protegido)
local sucessoCompilacao, funcaoScript = p
