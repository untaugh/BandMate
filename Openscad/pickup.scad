/* BandMate Project, pickup.scad
 * pickup.scad by Oskari Rundgren is licensed under the
 * Creative Commons Attribution-ShareAlike 4.0 International License.
 */

$fn = 64;

p_height = 8; // Height without magnet. Top piece adds 1mm. 
m_height = 10;  // Height of magnet. Just for show. 
m_radius = 2; // Radius of magnet hole. 
p_mult = 1.1; // Hole size multiplier. For fixing printer size errors. 
s_radius = 2; // Radius of screw hole.  
s_dist = 30; // Distance of screw hole to hole. 
b_radius = 10; // Radius of bottom plate. 

pickup();

module pickup()
{	
	/* Magnet. */
	%cylinder(r=m_radius,h=m_height);

	/* Assembly. */
	difference()
	{
		union()
		{
			pickup_bottom(); // Bottom plate. 
			cylinder(r=m_radius*p_mult+1.5,h=p_height); // Bobbin. 
		}
		cylinder(r=m_radius*p_mult,h=20); // Middle hole. 
	}
}


/* Bottom plate. */
module pickup_bottom()
{
  difference()
  {
    linear_extrude(height=1)
    hull()
    {
      translate([-s_dist/2,0,0]) circle(r=s_radius+2);
      circle(r=b_radius); 
      translate([s_dist/2,0,0]) circle(r=s_radius+2);
    }
    union() // Screw holes. 
    {
      translate([-s_dist/2,0,0]) cylinder(r=s_radius,h=10,center=true);
      translate([s_dist/2,0,0]) cylinder(r=s_radius,h=10,center=true);
    }
  }
}
