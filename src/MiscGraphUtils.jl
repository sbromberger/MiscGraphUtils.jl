module MiscGraphUtils

using GraphIO
using LightGraphs

export graphcat

# hat tip: @iamed2
function graphcat(g)
           io = IOBuffer()
           GraphIO.savegml(io, g)
           graphstr = String(io)
           p = pipeline(`echo $graphstr`, `gml2gv`, `dot -Tpng`, `imgcat`)
           run(p)
end
end # module
