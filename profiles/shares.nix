{
  office = {
    user = {
      public-key =
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIABVd0cIdwKzf4yLoRXQwjaaVYPFv8ZfYvTUMOMTFJ/p freeman@nixos";
    };
    system = {
      public-key =
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK9lhSffZNM3UYm884iQc/XmWL+g5fnePXUh4mPFkuNy root@nixos";
    };
    wg = { public-key = "trmPW+CV8BbXfDMbe7I7IFwRh5ke8vpbDlgisSoH6ng="; };
  };
  tronlink = {
    wg = { public-key = "MEjaDVdOqGEOjO6m23yHq5ZCzeZC0Id8jxCKEUPdxhw="; };
  };
  tc = {
    system = {
      public-key =
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKcBsPZi+OYEL/RCSGZMr82x0UGUaghP3AGl6M57ssjn";
    };
    wg = { public-key = "9TXI2YQ0cdhW3xBhxzuHpPuISR7k2NwTjZ2Sq/lwoE0="; };
    https = {
      cert = ''
        -----BEGIN CERTIFICATE-----
        MIIEfjCCBCSgAwIBAgIQD3nlNFD/J0gygrwYhZhhOjAKBggqhkjOPQQDAjBtMQsw
        CQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cu
        ZGlnaWNlcnQuY29tMSwwKgYDVQQDEyNFbmNyeXB0aW9uIEV2ZXJ5d2hlcmUgRUND
        IERWIFRMUyBDQTAeFw0yMjA5MDcwMDAwMDBaFw0yMzA5MDcyMzU5NTlaMBsxGTAX
        BgNVBAMTEGZyZWVtYW4uZW5naW5lZXIwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNC
        AATAKr/HKd6HNfQIOBY5nMiGnnR+02jSTp/9QahfMvcFU+LuyN86WERRVEyXtS6s
        3b5+Vqpdh4/3z7ilm2g+KhlRo4IC9jCCAvIwHwYDVR0jBBgwFoAU1d6F3kpGhs1h
        XM+qKPQlp3wp4aUwHQYDVR0OBBYEFD+Nf65KRRKnxcfAJOqdt6fIRsmIMDEGA1Ud
        EQQqMCiCEGZyZWVtYW4uZW5naW5lZXKCFHd3dy5mcmVlbWFuLmVuZ2luZWVyMA4G
        A1UdDwEB/wQEAwIHgDAdBgNVHSUEFjAUBggrBgEFBQcDAQYIKwYBBQUHAwIwPgYD
        VR0gBDcwNTAzBgZngQwBAgEwKTAnBggrBgEFBQcCARYbaHR0cDovL3d3dy5kaWdp
        Y2VydC5jb20vQ1BTMIGABggrBgEFBQcBAQR0MHIwJAYIKwYBBQUHMAGGGGh0dHA6
        Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBKBggrBgEFBQcwAoY+aHR0cDovL2NhY2VydHMu
        ZGlnaWNlcnQuY29tL0VuY3J5cHRpb25FdmVyeXdoZXJlRUNDRFZUTFNDQS5jcnQw
        CQYDVR0TBAIwADCCAX4GCisGAQQB1nkCBAIEggFuBIIBagFoAHcA6D7Q2j71BjUy
        51covIlryQPTy9ERa+zraeF3fW0GvW4AAAGDF5Ol9AAABAMASDBGAiEA70JrKOOx
        s0bCjOa1fSaSx+fM2TmEEOjWWC3O4UW6ceQCIQDRRzK2N2RMfx6QQntTKwOsAnuy
        nVYZZYjlgP39iGwQ2AB1ADXPGRu/sWxXvw+tTG1Cy7u2JyAmUeo/4SrvqAPDO9ZM
        AAABgxeTph0AAAQDAEYwRAIgKAByVOFRzgKf8czUfE0IcfNchov4yKA6j6mphaN0
        H9sCIB4PXkb9JkamZn/cvnCQzXuOxnDCpHMk7L81eh/oGBJgAHYAtz77JN+cTbp1
        8jnFulj0bF38Qs96nzXEnh0JgSXttJkAAAGDF5OmLwAABAMARzBFAiAj/HG3Bv26
        6MnNalsl879b9KXiDojiXpF/iY1luAdqsgIhAPZWfK8BjJwye4fNWbv8H5wds19W
        kJfZkYCCfDSgy5xAMAoGCCqGSM49BAMCA0gAMEUCIAhP0I6Iv1F/BnQwnC0pplkE
        zdIvTsLHeHjGL2So7/iIAiEAwwlxQssC05GCjyif3yb1xAPSuo0F8OKB65ttn5AV
        wTc=
        -----END CERTIFICATE-----
      '';
    };
  };
  dn42 = {
    root-ca = ''
      -----BEGIN CERTIFICATE-----
      MIID8DCCAtigAwIBAgIFIBYBAAAwDQYJKoZIhvcNAQELBQAwYjELMAkGA1UEBhMC
      WEQxDTALBgNVBAoMBGRuNDIxIzAhBgNVBAsMGmRuNDIgQ2VydGlmaWNhdGUgQXV0
      aG9yaXR5MR8wHQYDVQQDDBZkbjQyIFJvb3QgQXV0aG9yaXR5IENBMCAXDTE2MDEx
      NjAwMTIwNFoYDzIwMzAxMjMxMjM1OTU5WjBiMQswCQYDVQQGEwJYRDENMAsGA1UE
      CgwEZG40MjEjMCEGA1UECwwaZG40MiBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkxHzAd
      BgNVBAMMFmRuNDIgUm9vdCBBdXRob3JpdHkgQ0EwggEiMA0GCSqGSIb3DQEBAQUA
      A4IBDwAwggEKAoIBAQDBGRDeAYYR8YIMsNTl/5rI46r0AAiCwM9/BXohl8G1i6PR
      VO76BA931VyYS9mIGMEXEJLlJPrvYetdexHlvrqJ8mDJO4IFOnRUYCNmGtjNKHvx
      6lUlmowEoP+dSFRMnbwtoN9xrmRHDed1BfTFAirSDL6jY1RiK60p62oIpF6o6/FS
      FE7RXUEv0xm65II2etGj8oT2B7L2DDDb23bu6RQFx491tz/V1TVW0JJE3yYeAPqu
      y3rJUGddafj5/SWnHdtAsUK8RVfhyRxCummAHuolmRKfbyOj0i5KzRXkfEn50cDw
      GQwVUM6mUbuqFrKC7PRhRIwc3WVgBHewTZlnF/sJAgMBAAGjgaowgacwDgYDVR0P
      AQH/BAQDAgEGMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFFR2iLLAtTDQ/E/J
      bTv5jFURrBUVMB8GA1UdIwQYMBaAFFR2iLLAtTDQ/E/JbTv5jFURrBUVMEQGA1Ud
      HgQ9MDugOTAHggUuZG40MjAKhwisFAAA//wAADAihyD9QgAAAAAAAAAAAAAAAAAA
      //8AAAAAAAAAAAAAAAAAADANBgkqhkiG9w0BAQsFAAOCAQEAXKQ7QaCBaeJxmU11
      S1ogDSrZ7Oq8jU+wbPMuQRqgdfPefjrgp7nbzfUW5GrL58wqj+5/FAqltflmSIHl
      aB4MpqM8pyvjlc/jYxUNFglj2WYxO0IufBrlKI5ePZ4omUjpR4YR4gQpYCuWlZmu
      P6v/P0WrfgdFTk0LGEA9OwKcTqkPpcI/SjB3rmZcs42yQWvimAF94GtScE09uKlI
      9QLS2UBmtl5EJRFVrDEC12dyamq8dDRfddyaT4MoQOAq3D9BQ1pHByu3pz/QFaJC
      1zAi8vbktPY7OMprTOc8pHDL3q8KFP8jJcoEzZ5Jw0vkCrULhLXvtFtjB0djzVxQ
      C0IKqQ==
      -----END CERTIFICATE-----
    '';
  };

  digitcert-global = {
    root-ca = ''
      -----BEGIN CERTIFICATE-----
      MIIDrzCCApegAwIBAgIQCDvgVpBCRrGhdWrJWZHHSjANBgkqhkiG9w0BAQUFADBh
      MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3
      d3cuZGlnaWNlcnQuY29tMSAwHgYDVQQDExdEaWdpQ2VydCBHbG9iYWwgUm9vdCBD
      QTAeFw0wNjExMTAwMDAwMDBaFw0zMTExMTAwMDAwMDBaMGExCzAJBgNVBAYTAlVT
      MRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5j
      b20xIDAeBgNVBAMTF0RpZ2lDZXJ0IEdsb2JhbCBSb290IENBMIIBIjANBgkqhkiG
      9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4jvhEXLeqKTTo1eqUKKPC3eQyaKl7hLOllsB
      CSDMAZOnTjC3U/dDxGkAV53ijSLdhwZAAIEJzs4bg7/fzTtxRuLWZscFs3YnFo97
      nh6Vfe63SKMI2tavegw5BmV/Sl0fvBf4q77uKNd0f3p4mVmFaG5cIzJLv07A6Fpt
      43C/dxC//AH2hdmoRBBYMql1GNXRor5H4idq9Joz+EkIYIvUX7Q6hL+hqkpMfT7P
      T19sdl6gSzeRntwi5m3OFBqOasv+zbMUZBfHWymeMr/y7vrTC0LUq7dBMtoM1O/4
      gdW7jVg/tRvoSSiicNoxBN33shbyTApOB6jtSj1etX+jkMOvJwIDAQABo2MwYTAO
      BgNVHQ8BAf8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUA95QNVbR
      TLtm8KPiGxvDl7I90VUwHwYDVR0jBBgwFoAUA95QNVbRTLtm8KPiGxvDl7I90VUw
      DQYJKoZIhvcNAQEFBQADggEBAMucN6pIExIK+t1EnE9SsPTfrgT1eXkIoyQY/Esr
      hMAtudXH/vTBH1jLuG2cenTnmCmrEbXjcKChzUyImZOMkXDiqw8cvpOp/2PV5Adg
      06O/nVsJ8dWO41P0jmP6P6fbtGbfYmbW0W5BjfIttep3Sp+dWOIrWcBAI+0tKIJF
      PnlUkiaY4IBIqDfv8NZ5YBberOgOzW6sRBc4L0na4UU+Krk2U886UAb3LujEV0ls
      YSEY1QSteDwsOoBrp+uvFRTp2InBuThs4pFsiv9kuXclVzDAGySj4dzp30d8tbQk
      CAUw7C29C79Fv1C5qfPrmAESrciIxpg0X40KPMbp1ZWVbd4=
      -----END CERTIFICATE-----
    '';
  };
}
