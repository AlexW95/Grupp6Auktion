package application;

public class Kund {
	String personnummer;
	String efternamn;
	String f�rnamn;
	String gatuadress;
	String ort;
	String telefon;
	String epost;

	@Override
	public String toString() {
		return f�rnamn + " " + efternamn;
	}
}
