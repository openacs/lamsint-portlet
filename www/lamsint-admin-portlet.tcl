ad_page_contract {

    The display logic for the LAMS Integration admin portlet
    
    @author Ernie Ghiglione (ErnieG@melcoe.mq.edu.au)
    @creation-date 2005-11-25
    @cvs-id $Id$

} -properties {
    
}

array set config $cf
set list_of_package_ids $config(package_id)

if {[llength $list_of_package_ids] > 1} {
    # We have a problem!
    return -code error "There should be only one instance of lamsint for admin purposes"
}        

set package_id [lindex $list_of_package_ids 0]        

set url [lindex [site_node::get_url_from_object_id -object_id $package_id] 0]


# we want to verify at least that a LAMS server has been configured

set lams_server_url [lamsint::get_lams_server_url]

if {[empty_string_p $lams_server_url]} {
    set configured_p 0
} else {
    set configured_p 1
}

ad_return_template 
