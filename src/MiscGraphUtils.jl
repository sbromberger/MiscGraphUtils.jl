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

function gcat(g, w=4, h=4)
     wcm = Measures.Length(:cm, w)
     hcm = Measures.Length(:cm, h)
     io = IOBuffer()
     draw(PNG(io, wcm, hcm), gplot(g));
     return nothing
end
end # module
