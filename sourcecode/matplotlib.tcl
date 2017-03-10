# units: kip, in

# Remove existing model
wipe

# Create ModelBuilder (with two-dimensions and 2 DOF/node)
model BasicBuilder -ndm 2 -ndf 2

# Create nodes
# ------------
# Create nodes & add to Domain - command: node nodeId xCrd yCrd
node 1   0.0  0.0
node 2 144.0  0.0
node 3 168.0  0.0
node 4  72.0 96.0
    
# Set the boundary conditions - command: fix nodeID xResrnt? yRestrnt?
fix 1 1 1 
fix 2 1 1
fix 3 1 1
    
# Define materials for truss elements
# -----------------------------------
# Create Elastic material prototype - command: uniaxialMaterial Elastic matID E
uniaxialMaterial Elastic 1 3000

# 
# Define elements
#

# Create truss elements - command: element truss trussID node1 node2 A matID
element Truss 1 1 4 10.0 1
element Truss 2 2 4 5.0 1
element Truss 3 3 4 5.0 1
        
# Define loads
# ------------
#

# create a Linear TimeSeries with a tag of 1
timeSeries Linear 1
    
# Create a Plain load pattern associated with the TimeSeries,
# command: pattern Plain $patternTag $timeSeriesTag { load commands }

pattern Plain 1 1 {
	
   # Create the nodal load - command: load nodeID xForce yForce
   load 4 100 -50
}

# Create the system of equation
system BandSPD
    
# Create the DOF numberer, the reverse Cuthill-McKee algorithm
numberer RCM
    
# Create the constraint handler, a Plain handler is used as homo constraints
constraints Plain

# Create the integration scheme, the LoadControl scheme using steps of 1.0
integrator LoadControl 1.0

# Create the solution algorithm, a Linear algorithm is created
algorithm Linear

# create the analysis object 
analysis Static 

# create a Recorder object for the nodal displacements at node 4
recorder Node -file example.out -time -node 4 -dof 1 2 disp

# create a Recorder for element forces, one for global system and the other for local system
recorder Element -file eleGlobal.out -time -ele 1 2 3 forces
recorder Element -file eleLocal.out  -time -ele 1 2 3 basicForces

analyze 10