rm(list=ls()) # Clears workspace

#system("sudo apt install librsvg2-dev libv8-dev -y") # Install linux dependency for rsvg 

renv::restore() # Loads information about package dependencies

PKG <- c("DiagrammeR","renv","rsvg", "DiagrammeRsvg")

for (p in PKG) {
  if(!require(p,character.only = TRUE)) {  
    install.packages(p)
    require(p,character.only = TRUE)}
}
rm(PKG,p)
#renv::snapshot() # Saves information about package dependencies



## Graph

# a_graph <-
#   create_graph() %>%
#   add_node(label = "as", 
#            node_aes = node_aes(shape = "rectangle",
#                                color = "steelblue",
#                                fillcolor = "lightblue",
#                                fontcolor = "gray35")) %>%
#   add_node() %>%
#   add_node() %>%
#   add_node() %>%
#   add_edge(from = 1, to = 2, 
#            edge_aes = edge_aes(color = "red",
#                                arrowhead = "vee",
#                                tooltip = "Red Arrow")) %>%
#   add_edge(from = 2, to = 3) %>%
#   add_edge(from = 3, to = 4)
# 
# render_graph(a_graph, layout = "fr")


## Basic

grViz("digraph {
  
graph[layout = dot, rankdir = LR]

# define the global styles of the nodes. We can override these if we wish
node [shape = plaintext]

a[label='Channel Deepening']

b[label='Change in suspended \n sediment']
c[label='Change in tidal \n hydrodynamics']
d[label='Change in channel \n traffic']
e[label='Dredge disposal']
f[label='Change in benthic \n geomorphology'] 

h[label='Change in water quality']
i[label='Change in recreational \n quality']
k[label='Change in fish catch']
l[label='Change in flooding']
m[label='Change in shoreline erosion']
j[label='Change in oil spill risk']
s[label='Change in landscape \n aesthetics']

n[label='Change in commercial fishing \n net revenue']
o[label='Change in expected property \n damage']
p[label='Change in property value']
q[label='Change in recreation value']

a -> {b c d e f}
b -> {h i k}
c -> {h l m}
d -> {i l m j s}
e -> {h k}
h -> {p q}
i -> {p q}
j -> {n q}
k -> {n q}
l -> {o p}
m -> {o p}
s -> {p q}
}")

## Grouped channel deepening figure

cd<-grViz("digraph {
  
graph[layout = dot, rankdir = LR, splines = line]

# define the global styles of the nodes and edges. We can override these if we wish https://graphviz.org/doc/info/attrs.html
node [shape = plaintext]
edge [arrowhead = vee] // edge [arrowtail = none, style = tapered, penwidth = 5, dir = back]

subgraph cluster_0 {
  graph[shape = rectangle]
  
subgraph cluster_1 {
  graph[shape = rectangle]
  pencolor=transparent

  label = <<B>Action</B>>
  a[label='Channel deepening']
}

subgraph cluster_2 {
  graph[shape = rectangle]
  pencolor=transparent // https://stackoverflow.com/questions/7357225/remove-rectangle-from-graphviz-dot-cluster-subgraph
  
  label = <<B>Environmental Change   </B>>
  b[label='Change in suspended \n sediment']
  c[label='Change in tidal \n hydrodynamics']
  d[label='Change in channel \n traffic']
  e[label='Dredge disposal']
  f[label='Change in benthic \n geomorphology']
  g[label='Oil storage facility']
  gg[label='Pipelines']
}

subgraph cluster_3 {
  graph[shape = rectangle]
  pencolor=transparent
  
  label = <<B>Change in Environmental Service   </B>> // https://stackoverflow.com/questions/56364683/how-can-i-size-table-nodes-in-graphviz-that-contain-bold-text
  y[label='']
  i[label='Change in fish catch']
  j[label='Change in flooding']
  k[label='Change in shoreline \n erosion']
  l[label='Change in oil spill risk']
  m[label='Change in landscape \n aesthetics/access']
  mm[label='Change in rare species']
}
 
subgraph cluster_4 {
  graph[shape = rectangle]
  pencolor=transparent

  label = <<B>Change in Value</B>>
  x[label='']
  n[label='Change in commercial \n fishing net revenue']
  o[label='Change in property \n value']
  p[label='Change in recreation \n value']
  q[label='Change in drinking water \n treatment cost']
  r[label='Change in non-use value']
  z[label='']
}}

a:e -> b:w // ports and edges https://stackoverflow.com/questions/30260377/dot-language-with-concentrate-true-confusing-the-graph
a:e -> c:w
a:e -> d:w
a:e -> e:w
a:e -> f:w
a:e -> g:w
a:e -> gg:w
b:e -> i:w
b:e -> m:w
c:e -> j:w
c:e -> k:w
d:e -> j:w 
d:e -> k:w 
d:e -> l:w 
d:e -> m:w 
e:e -> i:w
f:e -> i:w
f:e -> mm:w
g:e -> l:w
gg:e -> l:w
i:e -> p:w
i:e -> n:w
j:e -> o:w
j:e -> p:w
k:e -> o:w
k:e -> p:w
l:e -> n:w
l:e -> o:w
l:e -> p:w
l:e -> q:w
m:e -> o:w
m:e -> p:w
mm:e -> r:w
}")

## Grouped desalination figure

d<-grViz("digraph {
  
graph[layout = dot, rankdir = LR, splines = line]

# define the global styles of the nodes. We can override these if we wish
node [shape = plaintext]
edge [arrowhead=vee]

subgraph cluster_0 {
  graph[shape = rectangle]
  
subgraph cluster_1 {
  graph[shape = rectangle]
  pencolor=transparent

  label = <<B>Action</B>>
  a[label='Desalination']
}

subgraph cluster_2 {
  graph[shape = rectangle]
  pencolor=transparent 
  
  label = <<B>Environmental Change   </B>>
  b[label='Change in estuarine \n salinity']
  c[label='Entrainment']
  d[label='Change in shoreline \n industrial density']
  e[label='Change in greenhouse \n gas pollution']
  f[label='Change in other atmospheric \n pollution']
  g[label='Change in chemical usage']
}

subgraph cluster_3 {
  graph[shape = rectangle]
  pencolor=transparent
  
  label = <<B>Change in Environmental Service   </B>> 
  zz[label='', height = .7, fixedsize = TRUE]
  h[label='Change in climate']
  j[label='Change in fish catch']
  k[label='Change in health']
  l[label='Change in landscape \n aesthetics']
  z[label='',height = .25, fixedsize = TRUE]
}
 
subgraph cluster_4 {
  graph[shape = rectangle]
  pencolor=transparent
  
  label = <<B>Change in Value</B>>
  xx[label='', height = .35, fixedsize = TRUE]
  m[label='Change in commercial fishing \n net revenue']
  o[label='Change in property value']
  p[label='Change in recreation value']
  q[label='Change in adjusted mortality']
  r[label='Change in climate-related \n damage']
}}

a:e -> b:w
a:e -> c:w
a:e -> d:w
a:e -> e:w
a:e -> f:w
a:e -> g:w
b:e -> j:w
c:e -> j:w
d:e -> l:w
e:e -> h:w
f:e -> k:w 
f:e -> l:w
g:e -> k:w
h:e -> r:w
j:e -> m:w 
j:e -> p:w
k:e -> q:w
l:e -> o:w 
l:e -> p:w
}")

writeLines(export_svg(cd),"channel-deepening.svg")
writeLines(export_svg(d),"desalination.svg")
