# service profile instance configuration
class ucsm_dockerdc::service_profiles(
$service_profile_list=undef,
){
    include ::ucsm_dockerdc

    if ($service_profile_list != undef) {
        $service_profile_list.each |$service_profile| {
            notify { $service_profile['name'] : }
            ucsm_serviceprofile { "Service Profile ${service_profile['name']}" :
                policy_name    => $service_profile['name'],
                src_templ_name => $service_profile['src_templ_name'],
                ip             => $ucsm_dockerdc::login_info['ip'],
                username       => $ucsm_dockerdc::login_info['username'],
                password       => $ucsm_dockerdc::login_info['password'],
                state          => 'present',
                # state        => 'absent',
            }
        }
    }
}
