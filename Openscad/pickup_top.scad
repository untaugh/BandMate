/* BandMate Project, pickup_top.scad
 * pickup_top.scad by Oskari Rundgren is licensed under the
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

pickup_top();

module pickup_top()
{
	difference()
	{
		union()
		{
			pickup_bottom();
			cylinder(r=b_radius,h=1);
		}
		union()
		{
			cylinder(r=m_radius*p_mult,h=4,center=true);
			translate([0,0,0.5]) cylinder(r=m_radius*p_mult+2,h=2);
		}
	}
}