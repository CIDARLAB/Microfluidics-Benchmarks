# Standard Sizes:

## MUX 
```
spacing=500 
width=400 
length=100 
stageLength=1000 
flowChannelWidth=100 
controlChannelWidth=50
```

## LONG CELL TRAP
```
chamberWidth=100 
chamberLength=100 
chamberSpacing=30 
feedingChannelWidth=100
```

## GRADIENT GENERATOR
```
numberOfBends=10 
bendSpacing=100 
bendLength=500 
channelWidth=100 
spacing=2000
```

# TREE 
```
spacing=500 
flowChannelWidth=100 
stageLength=500
```

# LOGIC ARRAY
```
flowChannelWidth=100 
controlChannelWidth=50 
chamberLength=100 
chamberWidth=100 
portRadius=100 
componentSpacing=300
```

# MIXER
```
bendSpacing=100
bendLength=100
channelWidth=100
```

# SQUARE CELL TRAP
```
height=30
channelWidth=100
channelLength=1000
chamberWidth=500
chamberLength=500
chamberHeight=2
```

# ROTARY MIXER
```
radius=1000
flowChannelWidth=100
controlChannelWidth=50
valveWidth=200
valveLength=200
valveSpacing=400
height=30
```

## Notes
Regex for capturing the parameters in mint 
```
[a-z]+([A-Z]([a-z]|[A-Z])+)?=\d+
```