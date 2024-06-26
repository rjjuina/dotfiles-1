{ config, ... }:
let
  dbDomain = "freeman.engineer";
  realm = "FREEMAN.ENGINEER";
  dbSuffix = "dc=freeman,dc=engineer";
  ldapRootUser = "admin";
in {
  services = {
    sssd = {
      enable = true;
      config = ''
        [sssd]
        config_file_version = 2
        services = nss, pam, ssh, sudo
        domains = ${dbDomain}
        [pac]
        [nss]
        [pam]
        [sudo]
        debug_level = 0x3ff0

        [domain/${dbDomain}]
        ldap_schema = rfc2307bis
        id_provider = ldap
        auth_provider = krb5
        sudo_provider = ldap
        access_provider = simple
        chpass_provider = krb5

        ldap_uri = ldaps://${config.networking.fqdn}
        ldap_search_base = ${dbSuffix}

        ldap_default_bind_dn = cn=${ldapRootUser},${dbSuffix}
        ldap_sudo_search_base = ou=SUDOers,${dbSuffix}
        ldap_sudo_include_regexp = true
        ldap_sudo_use_host_filter = false
        ldap_sasl_mech = GSSAPI
        ldap_sasl_authid = host/${config.networking.fqdn}
        ldap_sasl_realm = ${realm}
        cache_credentials = true

        use_fully_qualified_names = false

        krb5_realm = FREEMAN.ENGINEER
        krb5_server = ${config.networking.fqdn}
        krb5_validate = true
        debug_level = 0x3ff0
      '';
    };
  };
}
