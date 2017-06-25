module MiscGraphUtils

using GraphIO
using GraphPlot
using Compose
using Measures
using LightGraphs

export graphcat, gcat

# hat tip: @iamed2
function graphcat(g)
           io = IOBuffer()
           GraphIO.savegml(io, g)
           graphstr = String(io)
           p = pipeline(`echo $graphstr`, `gml2gv`, `dot -Tpng`, `imgcat`)
           run(p)
end

function gcat(g, w=8cm, h=8cm)
     io = IOBuffer()
     draw(PNG(io, w, h), gplot(g));
     return nothing
end
end # module
