package com.listowel;

import static org.junit.Assert.*;
import junit.framework.Assert;

import org.junit.Test;

public class SilkDescriptionTest {

	@Test
	public void Arbourfield() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Emerald green & orange hoops, green cap");
		Assert.assertEquals("emerald_green with orange hoops",toTest.getBody().toString());
		Assert.assertEquals("emerald_green with orange hoops",toTest.getSleeve().toString());
		Assert.assertEquals("green plain", toTest.getCap().toString());
	}

	@Test
	public void CapeWolfe() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("White, large royal blue spots & sleeves, striped cap");
		Assert.assertEquals("white with royal_blue large_spots",toTest.getBody().toString());
		Assert.assertEquals("royal_blue plain",toTest.getSleeve().toString());
		Assert.assertEquals("white with royal_blue striped", toTest.getCap().toString());
	}

	@Test
	public void DudesAndDiamonds() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Emerald green & dark blue diabolo, dark blue sleeves, quartered cap");
		Assert.assertEquals("emerald_green with dark_blue diabolo",toTest.getBody().toString());
		Assert.assertEquals("dark_blue plain",toTest.getSleeve().toString());
		Assert.assertEquals("emerald_green with dark_blue quartered", toTest.getCap().toString());
	}

	@Test
	public void Nasution() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Pink, emerald green chevron, halved sleeves, quartered cap");
	}

	@Test
	public void SocialClimber() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Orange, dark blue chevron & sleeves, dark blue cap, orange star");
	}

	@Test
	public void WychwoodWarrior() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Black, light blue stars");
	}

	@Test
	public void Zannda() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Green, red epaulettes, green cap");
	}

	@Test
	public void YesIAm() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Emerald green, white star, hooped cap");
	}

	@Test
	public void ArtisticIntegrity() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("White, large royal blue spots & sleeves, striped cap");
	}

	@Test
	public void Abushamah() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Royal blue,white epaulettes, light blue and dark Blue striped cap");
	}

	@Test
	public void DanishDuke() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Red, royal blue star, royal blue stars on cap");
	}

	@Test
	public void Focussed() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("White, purple panel, check cap");
	}

	@Test
	public void PrincessAloof() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Green & red hoops, white cap");
	}

	@Test
	public void KodiacsBack() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("dark green, light green chevron, collar and sleeves, dark green cap, light green peak");
	}

	@Test
	public void TomDooley() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Pink & emerald green quartered, check sleeves & cap");
	}

	@Test
	public void HelensArmada() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Black, red epaulettes, yellow sleeves, yellow cap, red star");
	}

	@Test
	public void EinsteinsFolly() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("White, purple panel, check cap");
	}

	@Test
	public void InisMeain() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Yellow, dark blue sash, dark blue cap, yellow star");
	}

	@Test
	public void HoldTheLine() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Black, red epaulettes, yellow sleeves, yellow cap, red star");
	}

	@Test
	public void Tarana() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Green, red epaulettes, green cap");
	}

	@Test
	public void BeachOfFalesa() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Emerald green & orange hooped, white cap");
	}

	@Test
	public void DriftingMist() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Dark blue, pink triple diamond, pink sleeves, dark blue cap, pink diamond");
	}

	@Test
	public void Altruistic() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Red, white maltese cross, red cap");
	}

	@Test
	public void OdeToPsyche() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Dark blue, light blue cross sashes, diabolo on sleeves, white cap");
	}

	@Test
	public void VintageNouveau() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Black, white slvs, red cap, black star");
	}

	@Test
	public void CinCin() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Black and amber striped, white collar and cuffs, purple cap");
	}

	@Test
	public void FirstWarning() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Red, large white spots, red sleeves & cap");
	}

	@Test
	public void WindwardPassage() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Grey, dark green spots on sleeves, grey cap, dark green star");
	}

	@Test
	public void CrownOfAragon() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Royal blue, emerald green cross sashes & armlet, striped cap");
	}

	@Test
	public void Raydari() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Royal blue, yellow sash, royal blue & white hooped cap");
	}

	@Test
	public void GoldFocus() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("White, purple panel, check cap");
	}

	@Test
	public void KeepItCool() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Red, blue sleeves, black cap");
	}

	@Test
	public void Shadagann() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Emerald green & black chevrons, emerald green sleeves, hooped cap");
	}

	@Test
	public void FocasMor() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("grey,purple panel, check cap");
	}

	@Test
	public void Nidhaam() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Royal blue,white epaulettes, light blue and dark Blue striped cap");
	}

	@Test
	public void MrSnagsby() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Purple, yellow chevron & cap");
	}

	@Test
	public void Mahrajaan() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("White, black star, black stars on sleeves, black star on cap");
	}

	@Test
	public void OneCoolBoy() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Black, purple sash, purple sleeves, black seams, black & purple quartered cap");
	}

	@Test
	public void GeneralBunching() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("White, royal blue stars, royal blue sleeves, hooped cap");
	}

	@Test
	public void Alderwood() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Emerald green & orange hooped, white cap");
	}

	@Test
	public void GoldenWonder() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("White, gold hoop, black cap");
	}

	@Test
	public void Klepht() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Light blue, royal blue cross sashes, quartered cap");
	}

	@Test
	public void Hellberemembered() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Royal blue, emerald green hoop, royal blue sleeves, quartered cap");
	}

	@Test
	public void BurnAndTurn() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Yellow, royal blue hoop & armlet, white cap, royal blue star");
	}

	@Test
	public void Quantitativeeasing() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription(" Emerald green & orange hoops, red cap");
	}

	@Test
	public void TapNight() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Emerald green, yellow hoops, Quartered cap");
	}

	@Test
	public void UsuelSmurfer() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Yellow, dark blue sash, dark blue cap, yellow star");
	}

	@Test
	public void Balnaslow() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Maroon, white star & armlet, maroon cap, white star");
	}

	@Test
	public void Jacksonslady() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Emerald green & orange hoops, royal blue cap");
	}

	@Test
	public void PassTheHat() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("White, cyclamen sash, cyclamen cap, white hoop");
	}

	@Test
	public void Shanpallas() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Red, white star, white & red hooped sleeves, red cap");
	}

	@Test
	public void Cootamundra() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Black & emerald green check, emerald green sleeves, yellow cap");
	}

	@Test
	public void Muirhead() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Dark blue, yellow diamond & sleeves, yellow cap, red diamond");
	}

	@Test
	public void WiseOldOwl() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("EMERALD GREEN & ORANGE HOOPED, yellow cap");
	}

	@Test
	public void Heaney() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Emerald green, red hoop, hooped sleeves, red star on cap");
	}

	@Test
	public void CaseyTop() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Orange & black quartered, halved sleeves, quartered cap");
	}

	@Test
	public void OnTheWayOut() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("White & royal blue stripes, royal blue armlet, royal blue star on cap");
	}

	@Test
	public void YourBusy() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Black, purple seams, black sleeves, striped cap");
	}

	@Test
	public void Protaras() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Yellow & purple diamonds, yellow sleeves, yellow cap, purple diamonds");
	}

	@Test
	public void TomHorn() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("EMERALD GREEN & ORANGE HOOPED, orange cap");
	}

	@Test
	public void DesertmoreStream() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Maroon, white star & armlet, maroon cap, white star");
	}

	@Test
	public void Shield() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Emerald green & orange hooped, white cap");
	}

	@Test
	public void HashBrown() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Red, yellow cross sashes, yellow armlet, yellow star on cap");
	}

	@Test
	public void IcyReply() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Black & white check, striped sleeves & cap");
	}

	@Test
	public void WellTuned() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Yellow, royal blue sash, check cap");
	}

	@Test
	public void AussieGuest() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Mauve, black sash, quartered cap");
	}

	@Test
	public void EgyptianWarrior() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Emerald green & orange hooped, white cap");
	}

	@Test
	public void FillYourHands() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Maroon, white star & armlet, maroon cap, white star");
	}

	@Test
	public void Shaiyzar() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Royal blue, dark blue sash, dark blue stars on sleeves, royal blue cap, dark blue stars");
	}

	@Test
	public void TomsArticle() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Dark blue & orange quartered, dark blue sleeves, orange star on cap");
	}

	@Test
	public void Alfiethegreat() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Dark blue, white sleeves, dark blue diabolo, dark blue cap, white star");
	}

	@Test
	public void DeputysPass() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Yellow, dark blue sash, dark blue cap, yellow star");
	}

	@Test
	public void Estilaam() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Royal blue, yellow epaulettes, red & light green striped sleeves, light green & yellow hooped cap");
	}

	@Test
	public void MinellaArts() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("White, maroon panel, quartered cap");
	}

	@Test
	public void SandymountDuke() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("White, red sash, red sleeves & cap");
	}

	@Test
	public void ThatsNice() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Yellow, royal blue spots, check cap");
	}

	@Test
	public void ThomasLedger() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Emerald green, white star, dark blue sleeves & cap");
	}

	@Test
	public void LolaKabana() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Dark blue & mauve diamonds, dark blue sleeves, mauve diamonds on cap");
	}

	@Test
	public void PremierStyle() {
		SilkDescription toTest = new SilkDescription();
		toTest.loadFromDescription("Royal blue & yellow halved, white sleeves, red cap");
	}

}
