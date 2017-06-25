module MiscGraphUtils

using GraphIO
using GraphPlots
using Compose
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

function gcat(g, w=4cm, h=4cm)
     io = IOBuffer()
     draw(PNG(io, w, h), gplot(g));
end
end # module
