param($NetworkPrefix, $DNSServer)
#NetworkPrefix must be given as #.#.#. ex. 10.0.0.
1..254 | ForEach-Object {
    $result = Resolve-DnsName "$NetworkPrefix$_" -Server $DNSServer -ErrorAction Ignore
    if ($result) { "$NetworkPrefix$_ -> $($result.NameHost)" }
}
