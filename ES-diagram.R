rm(list=ls()) # Clears workspace

PKG <- c("DiagrammeR","renv")

for (p in PKG) {
  if(!require(p,character.only = TRUE)) {  
    install.packages(p)
    require(p,character.only = TRUE)}
}
rm(PKG,p)
renv::snapshot()

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

## Grouped

grViz("digraph {
  
graph[layout = dot, rankdir = LR]

# define the global styles of the nodes. We can override these if we wish
node [shape = plaintext]

subgraph cluster_0 {
  graph[shape = rectangle]
  style = rounded
  bgcolor = Gold
  
  label = 'Action'
  a[label='Channel Deepening']
}

subgraph cluster_1 {
  graph[shape = rectangle]
  style = rounded
  bgcolor = Red
  
  label = 'Environmental Change'
  b[label='Change in suspended \n sediment']
  c[label='Change in tidal \n hydrodynamics']
  d[label='Change in channel \n traffic']
  e[label='Dredge disposal']
  f[label='Change in benthic \n geomorphology']
}

subgraph cluster_2 {
  graph[shape = rectangle]
  style = rounded
  bgcolor = Blue
  
  label = 'Change in Environmental Service'
  h[label='Change in water quality']
  i[label='Change in recreational \n quality']
  k[label='Change in fish catch']
  l[label='Change in flooding']
  m[label='Change in shoreline erosion']
  j[label='Change in oil spill risk']
  s[label='Change in landscape \n aesthetics']
}
 
subgraph cluster_3 {
  graph[shape = rectangle]
  style = rounded
  bgcolor = Green
  
  label = 'Change in value'
  n[label='Change in commercial fishing \n net revenue']
  o[label='Change in expected property \n damage']
  p[label='Change in property value']
  q[label='Change in recreation value']
}

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


