### A Pluto.jl notebook ###
# v0.11.0

using Markdown
using InteractiveUtils

# ╔═╡ 49dc1fe2-d00f-11ea-16f0-4f086766819b


# ╔═╡ d8e282de-d008-11ea-2e78-f31686a51a96


# ╔═╡ 0ddd1a1e-d00c-11ea-2a78-f525c0470d0e


# ╔═╡ 82b8f3ca-d003-11ea-070b-795a671470ee
using CSV

# ╔═╡ 8b044b6a-d003-11ea-005a-cd46827212ed
using Plots

# ╔═╡ 922ec798-d004-11ea-2fb8-fd85c5fea1f9
using DataFrames

# ╔═╡ 857040f2-d010-11ea-0f8a-c1821849601a
using StatsPlots

# ╔═╡ d00a1c84-d004-11ea-0b49-338a681619b4
df = CSV.File("/Users/xander/Documents/Foobot/20200727.csv", header=1,  dateformat="yyyy/mm/dd HH:MM:SS") |> DataFrame!

# ╔═╡ ef217a4e-d00f-11ea-1feb-9fb1ba6caba3
plot(df[" device local time"], df[" co2 (ppm)"], label="co2")

# ╔═╡ 0c3d0880-d010-11ea-25a2-d7eefda8d04b
plot(df[" device local time"], df[" tmp (C)"], label="tmp")

# ╔═╡ 05a1f94c-d010-11ea-34cb-610c95bf6862
plot(df[" device local time"], df[" voc (ppb)"], label="voc")

# ╔═╡ 3ba5dfe0-d010-11ea-13c6-eb41f3e44dbc
plot(df[" device local time"], df[" pm (ugm3)"], label="pm")

# ╔═╡ 02f55752-d010-11ea-1bef-8548be061256
plot(df[" device local time"], df[" global (%)"], label="global")

# ╔═╡ abf69dee-d005-11ea-01bf-b38bd180b2ae
DateTime("2020/07/23 11:43:57", "yyyy/mm/dd HH:MM:SS")

# ╔═╡ Cell order:
# ╠═82b8f3ca-d003-11ea-070b-795a671470ee
# ╠═8b044b6a-d003-11ea-005a-cd46827212ed
# ╠═922ec798-d004-11ea-2fb8-fd85c5fea1f9
# ╠═857040f2-d010-11ea-0f8a-c1821849601a
# ╠═d00a1c84-d004-11ea-0b49-338a681619b4
# ╠═ef217a4e-d00f-11ea-1feb-9fb1ba6caba3
# ╠═0c3d0880-d010-11ea-25a2-d7eefda8d04b
# ╠═05a1f94c-d010-11ea-34cb-610c95bf6862
# ╠═3ba5dfe0-d010-11ea-13c6-eb41f3e44dbc
# ╠═02f55752-d010-11ea-1bef-8548be061256
# ╠═49dc1fe2-d00f-11ea-16f0-4f086766819b
# ╠═abf69dee-d005-11ea-01bf-b38bd180b2ae
# ╠═d8e282de-d008-11ea-2e78-f31686a51a96
# ╠═0ddd1a1e-d00c-11ea-2a78-f525c0470d0e
