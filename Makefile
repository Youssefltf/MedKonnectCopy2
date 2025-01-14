default:
	rm -f MedKonnectEHR-base.zip SHA256SUMS
	zip -r MedKonnectEHR-base.zip . -x .git\* -x Makefile -x installer\*
	sha256sum -b MedKonnectEHR-base.zip > preSHA256SUMS
	head -c 64 preSHA256SUMS > SHA256SUMS
	rm -f preSHA256SUMS

clean:
	rm -f MedKonnectEHR-base.zip
