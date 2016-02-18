package tables;

public class Kund {
	private String personnummer;
	private String efternamn;
	private String f�rnamn;
	String gatuadress;
	String ort;
	String telefon;
	String epost;

	@Override
	public String toString() {
		return getF�rnamn() + " " + getEfternamn();
	}

	public String getF�rnamn() {
		return f�rnamn;
	}

	public void setF�rnamn(String f�rnamn) {
		this.f�rnamn = f�rnamn;
	}

	public String getEfternamn() {
		return efternamn;
	}

	public void setEfternamn(String efternamn) {
		this.efternamn = efternamn;
	}

	public String getPersonnummer() {
		return personnummer;
	}

	public void setPersonnummer(String personnummer) {
		this.personnummer = personnummer;
	}
}
