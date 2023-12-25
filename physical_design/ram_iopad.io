(globals
   version = 3
   io_order = clockwise
   space = 20	                  #Spacing between 2 IO pads
   total_edge = 3
	
)

(iopad
    (topleft
     (inst name="CornerCell1"	cell=pfrelr offset=0 orientation=R180 place_status=fixed )
)
(left
	(inst name ="VDD"    cell = pvdi place_status=fixed)
        (inst name ="VDDO"    cell = pvda place_status=fixed)
	(inst name ="addr0"   cell = pc3d01 place_status=fixed)
	(inst name ="addr1"   cell = pc3d01 place_status=fixed)
	(inst name ="addr2"   cell = pc3d01 place_status=fixed)
	(inst name ="addr3"   cell = pc3d01 place_status=fixed)
	(inst name ="Fwe"   cell = pc3d01 place_status=fixed)
	(inst name ="Fclk"   cell = pc3d01 place_status=fixed)
	(inst name ="Foe"   cell = pc3d01 place_status=fixed)
        (inst name ="VSS"   cell = pv0i place_status=fixed)
        (inst name ="VSSO"  cell = pv0a place_status=fixed)

)


(topright
	(inst name="CornerCell2"	cell=pfrelr offset=0 orientation=R90 place_status=fixed )
)


(top


	(inst name ="dataIO0"   cell = pc3d01 place_status=fixed)
	(inst name ="dataIO1"   cell = pc3d01 place_status=fixed)
	(inst name ="dataIO2"   cell = pc3d01 place_status=fixed)
	(inst name ="dataIO3"   cell = pc3d01 place_status=fixed)
	(inst name ="dataIO4"   cell = pc3d01 place_status=fixed)
	(inst name ="dataIO5"   cell = pc3d01 place_status=fixed)
	(inst name ="dataIO6"   cell = pc3d01 place_status=fixed)
        (inst name ="dataIO7"   cell = pc3d01 place_status=fixed)
	(inst name ="dataIO8"   cell = pc3d01 place_status=fixed)
	(inst name ="dataIO9"   cell = pc3d01 place_status=fixed)
        (inst name ="dataIO10"   cell = pc3d01 place_status=fixed)

)



(bottomright

	(inst name="CornerCell3"	cell=pfrelr offset=0 orientation=R0 place_status=fixed )
)

(right


	(inst name ="dataIO11"   cell = pc3d01 place_status=fixed)
	(inst name ="dataIO12"   cell = pc3d01 place_status=fixed)
	(inst name ="dataIO13"   cell = pc3d01 place_status=fixed)
	(inst name ="dataIO14"   cell = pc3d01 place_status=fixed)
	(inst name ="dataIO15"   cell = pc3d01 place_status=fixed)
	(inst name ="dataIO16"   cell = pc3d01 place_status=fixed)
        (inst name ="dataIO17"   cell = pc3d01 place_status=fixed)
	(inst name ="dataIO18"   cell = pc3d01 place_status=fixed)
	(inst name ="dataIO19"   cell = pc3d01 place_status=fixed)
        (inst name ="dataIO20"   cell = pc3d01 place_status=fixed)
	(inst name ="dataIO21"   cell = pc3d01 place_status=fixed)	

)


(bottomleft

	(inst name="CornerCell4"	cell=pfrelr offset=0 orientation=R270 place_status=fixed )
)

(bottom

	(inst name ="dataIO22"   cell = pc3d01 place_status=fixed)
	(inst name ="dataIO23"   cell = pc3d01 place_status=fixed)
	(inst name ="dataIO24"   cell = pc3d01 place_status=fixed)
	(inst name ="dataIO25"   cell = pc3d01 place_status=fixed)
	(inst name ="dataIO26"   cell = pc3d01 place_status=fixed)
	(inst name ="Fcs"   cell = pc3d01 place_status=fixed)
        (inst name ="dataIO27"   cell = pc3d01 place_status=fixed)
	(inst name ="dataIO28"   cell = pc3d01 place_status=fixed)
	(inst name ="dataIO29"   cell = pc3d01 place_status=fixed)
        (inst name ="dataIO30"   cell = pc3d01 place_status=fixed)
	(inst name ="dataIO31"   cell = pc3d01 place_status=fixed)

)
)


