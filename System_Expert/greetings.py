
from experta import *

class Greetings(KnowledgeEngine ):

    def __init__(self, symptom_map, if_not_matched, get_treatments, get_details):
        self.symptom_map = symptom_map
        self.if_not_matched = if_not_matched
        self.get_details = get_details
        self.get_treatments = get_treatments
        KnowledgeEngine.__init__(self)

    #code giving instructions on how to use the Expert System
    @DefFacts()
    def _initial_action(self):
        print("")
        print("Dans ce programme on va suivre votre sante mentale")
        print("")
        print("")
        print("Repondez par oui ou non")
        print("")
        yield Fact(action="trouver_maladie")

    #taking various input from user
    @Rule(Fact(action="trouver_maladie"), NOT(Fact(Qs1=W())), salience=0)
    def symptom_0(self):
        self.declare(Fact(Qs1=input("Ressentez-vous de la tristesse ?")))

    @Rule(Fact(action="trouver_maladie"), NOT(Fact(Qs2=W())), salience=1)
    def symptom_1(self):
        self.declare(Fact(Qs2=input("Avez-vous perdu de l interêt pour les activites que vous aimiez auparavant ?")))

    @Rule(Fact(action="trouver_maladie"), NOT(Fact(Qs3=W())), salience=2)
    def symptom_2(self):
        self.declare(Fact(Qs3=input("Vous sentez-vous fatigue ?")))

    @Rule(Fact(action="trouver_maladie"), NOT(Fact(Qs4=W())), salience=3)
    def symptom_3(self):
        self.declare(Fact(Qs4=input("Êtes-vous souvent nerveux ?")))

    @Rule(Fact(action="trouver_maladie"), NOT(Fact(Qs5=W())), salience=4)
    def symptom_4(self):
        self.declare(Fact(Qs5=input("Avez-vous un sentiment d’imminence ?")))

    @Rule(Fact(action="trouver_maladie"), NOT(Fact(Qs6=W())), salience=5)
    def symptom_5(self):
        self.declare(Fact(Qs6=input("Avez-vous une humeur elevee ?")))

    @Rule(Fact(action="trouver_maladie"), NOT(Fact(Qs7=W())), salience=6)
    def symptom_6(self):
        self.declare(Fact(Qs7=input("Avez-vous une energie accrue ?")))

    @Rule(Fact(action="trouver_maladie"), NOT(Fact(Qs8=W())), salience=7)
    def symptom_7(self):
        self.declare(Fact(Qs8=input("Avez-vous besoin de moins de sommeil que d’habitude ?")))

    @Rule(Fact(action="trouver_maladie"), NOT(Fact(Qs9=W())), salience=8)
    def symptom_8(self):
        self.declare(Fact(Qs9=input("Avez-vous des flashbacks ?")))

    @Rule(Fact(action="trouver_maladie"), NOT(Fact(Qs10=W())), salience=9)
    def symptom_9(self):
        self.declare(Fact(Qs10=input("EÉvitez-vous les rappels traumatiques ?")))

    @Rule(Fact(action="trouver_maladie"), NOT(Fact(Qs11=W())), salience=10)
    def symptom_10(self):
        self.declare(Fact(Qs11=input("Avez-vous des reactions de sursaut ?")))

    @Rule(Fact(action="trouver_maladie"), NOT(Fact(Qs12=W())), salience=11)
    def symptom_11(self):
        self.declare(Fact(Qs12=input("Avez-vous des pensees intrusives ?")))

    @Rule(Fact(action="trouver_maladie"), NOT(Fact(Qs13=W())), salience=12)
    def symptom_12(self):
        self.declare(Fact(Qs13=input("Avez-vous des comportements compulsifs ?")))

    @Rule(Fact(action="trouver_maladie"), NOT(Fact(Qs14=W())), salience=13)
    def symptom_13(self):
        self.declare(Fact(Qs14=input("Avez-vous des difficultes à vous concentrer ?")))
    
    @Rule(Fact(action="trouver_maladie"), NOT(Fact(Qs15=W())), salience=14)
    def symptom_14(self):
        self.declare(Fact(Qs15=input("Êtes-vous hyperactif ?")))
    @Rule(Fact(action="trouver_maladie"), NOT(Fact(Qs16=W())), salience=15)
    def symptom_15(self):
        self.declare(Fact(Qs16=input("Avez-vous un comportement impulsif ?")))

    @Rule(Fact(action="trouver_maladie"), NOT(Fact(Qs17=W())), salience=16)
    def symptom_16(self):
        self.declare(Fact(Qs17=input("Avez-vous des hallucinations ?")))

    @Rule(Fact(action="trouver_maladie"), NOT(Fact(Qs18=W())), salience=17)
    def symptom_17(self):
        self.declare(Fact(Qs18=input("Avez-vous un discours desorganise ?")))

        
    @Rule(Fact(action="trouver_maladie"), NOT(Fact(Qs19=W())), salience=18)
    def symptom_18(self):
        self.declare(Fact(Qs19=input("Avez-vous des delires ?")))   

    #different rules checking for each disease match
    @Rule(
        Fact(action="trouver_maladie"),
        Fact(Qs1="oui"),
        Fact(Qs2="oui"),
        Fact(Qs3="oui"),
        Fact(Qs4="non"),
        Fact(Qs5="non"),
        Fact(Qs6="non"),
        Fact(Qs7="non"),
        Fact(Qs8="non"),
        Fact(Qs9="non"),
        Fact(Qs10="non"),
        Fact(Qs11="non"),
        Fact(Qs12="non"),
        Fact(Qs13="non"),
        Fact(Qs14="non"),
        Fact(Qs15="non"),
        Fact(Qs16="non"),
        Fact(Qs17="non"),
        Fact(Qs18="non"),
        Fact(Qs19="non"),
    )
    def disease_0(self):
        self.declare(Fact(disease="depression"))

    @Rule(
        Fact(action="trouver_maladie"),
        Fact(Qs1="non"),
        Fact(Qs2="non"),
        Fact(Qs3="non"),
        Fact(Qs4="oui"),
        Fact(Qs5="oui"),
        Fact(Qs6="non"),
        Fact(Qs7="non"),
        Fact(Qs8="non"),
        Fact(Qs9="non"),
        Fact(Qs10="non"),
        Fact(Qs11="non"),
        Fact(Qs12="non"),
        Fact(Qs13="non"),
        Fact(Qs14="non"),
        Fact(Qs15="non"),
        Fact(Qs16="non"),
        Fact(Qs17="non"),
        Fact(Qs18="non"),
        Fact(Qs19="non"),
    )
    def disease_1(self):
        self.declare(Fact(disease="anxiete"))

    @Rule(
        Fact(action="trouver_maladie"),
        Fact(Qs1="non"),
        Fact(Qs2="non"),
        Fact(Qs3="non"),
        Fact(Qs4="non"),
        Fact(Qs5="non"),
        Fact(Qs6="oui"),
        Fact(Qs7="oui"),
        Fact(Qs8="oui"),
        Fact(Qs9="non"),
        Fact(Qs10="non"),
        Fact(Qs11="non"),
        Fact(Qs12="non"),
        Fact(Qs13="non"),
        Fact(Qs14="non"),
        Fact(Qs15="non"),
        Fact(Qs16="non"),
        Fact(Qs17="non"),
        Fact(Qs18="non"),
        Fact(Qs19="non"),
    )
    def disease_2(self):
        self.declare(Fact(disease="bipolaire"))

    @Rule(
   Fact(action="trouver_maladie"),
        Fact(Qs1="non"),
        Fact(Qs2="non"),
        Fact(Qs3="non"),
        Fact(Qs4="non"),
        Fact(Qs5="non"),
        Fact(Qs6="non"),
        Fact(Qs7="non"),
        Fact(Qs8="non"),
        Fact(Qs9="oui"),
        Fact(Qs10="oui"),
        Fact(Qs11="oui"),
        Fact(Qs12="non"),
        Fact(Qs13="non"),
        Fact(Qs14="non"),
        Fact(Qs15="non"),
        Fact(Qs16="non"),
        Fact(Qs17="non"),
        Fact(Qs18="non"),
        Fact(Qs19="non"),
    )
    def disease_3(self):
        self.declare(Fact(disease="post-traumatique"))

    @Rule(
        Fact(action="trouver_maladie"),
        Fact(Qs1="non"),
        Fact(Qs2="non"),
        Fact(Qs3="non"),
        Fact(Qs4="non"),
        Fact(Qs5="non"),
        Fact(Qs6="non"),
        Fact(Qs7="non"),
        Fact(Qs8="non"),
        Fact(Qs9="non"),
        Fact(Qs10="non"),
        Fact(Qs11="non"),
        Fact(Qs12="oui"),
        Fact(Qs13="oui"),
        Fact(Qs14="non"),
        Fact(Qs15="non"),
        Fact(Qs16="non"),
        Fact(Qs17="non"),
        Fact(Qs18="non"),
        Fact(Qs19="non"),
    )
    def disease_4(self):
        self.declare(Fact(disease="obsessionnel-compulsif"))

    @Rule(
        Fact(action="trouver_maladie"),
        Fact(Qs1="non"),
        Fact(Qs2="non"),
        Fact(Qs3="non"),
        Fact(Qs4="non"),
        Fact(Qs5="non"),
        Fact(Qs6="non"),
        Fact(Qs7="non"),
        Fact(Qs8="non"),
        Fact(Qs9="non"),
        Fact(Qs10="non"),
        Fact(Qs11="non"),
        Fact(Qs12="non"),
        Fact(Qs13="non"),
        Fact(Qs14="oui"),
        Fact(Qs15="oui"),
        Fact(Qs16="oui"),
        Fact(Qs17="non"),
        Fact(Qs18="non"),
        Fact(Qs19="non"),
    )
    def disease_5(self):
        self.declare(Fact(disease="hyperactivite"))

    @Rule(
        Fact(action="trouver_maladie"),
        Fact(Qs1="non"),
        Fact(Qs2="non"),
        Fact(Qs3="non"),
        Fact(Qs4="oui"),
        Fact(Qs5="non"),
        Fact(Qs6="oui"),
        Fact(Qs7="oui"),
        Fact(Qs8="non"),
        Fact(Qs9="non"),
        Fact(Qs10="non"),
        Fact(Qs11="non"),
        Fact(Qs12="non"),
        Fact(Qs13="non"),
        Fact(Qs14="non"),
        Fact(Qs15="non"),
        Fact(Qs16="non"),
        Fact(Qs17="oui"),
        Fact(Qs18="oui"),
        Fact(Qs19="oui"),
    )
    def disease_6(self):
        self.declare(Fact(disease="schizophrenie"))

  
    #when the user s input doesn t match any disease in the knowledge base
    @Rule(Fact(action="trouver_maladie"), Fact(disease=MATCH.disease), salience=1)
    def disease(self, disease):
        print("tetetetetetetetet")
        id_disease = disease
        disease_details = self.get_details(id_disease)
        treatments = self.get_treatments(id_disease)
        print("")
        print("Your symptoms match %s\n" % (id_disease))
        print("A short description of the disease is given below :\n")
        print(disease_details + "\n")
        print(
            "The common medications and procedures suggested by other real doctors are: \n"
        )
        print(treatments + "\n")

    @Rule(
        Fact(action="trouver_maladie"),
        Fact(Qs1=MATCH.Qs1),
        Fact(Qs2=MATCH.Qs2),
        Fact(Qs3=MATCH.Qs3),
        Fact(Qs4=MATCH.Qs4),
        Fact(Qs5=MATCH.Qs5),
        Fact(Qs6=MATCH.Qs6),
        Fact(Qs7=MATCH.Qs7),
        Fact(Qs8=MATCH.Qs8),
        Fact(Qs9=MATCH.Qs9),
        Fact(Qs10=MATCH.Qs10),
        Fact(Qs11=MATCH.Qs11),
        Fact(Qs12=MATCH.Qs12),
        Fact(Qs13=MATCH.Qs13),
        Fact(Qs14=MATCH.Qs14),
        Fact(Qs15=MATCH.Qs15),
        Fact(Qs16=MATCH.Qs16),
        Fact(Qs17=MATCH.Qs17),
        Fact(Qs18=MATCH.Qs18),
        Fact(Qs19=MATCH.Qs19),
        NOT(Fact(disease=MATCH.disease)),
        salience=-999
    )
    def not_matched(
        self,
        Qs1,
        Qs2,
        Qs3,
        Qs4,
        Qs5,
        Qs6,
        Qs8,
        Qs9,
        Qs10,
        Qs11,
        Qs12,
        Qs13,
        Qs14,
        Qs15,
        Qs16,
        Qs17,
        Qs18,
        Qs19,
    ):
        print("\nThe bot did not find any diseases that match your exact symptoms.")
        lis = [
        Qs1,
        Qs2,
        Qs3,
        Qs4,
        Qs5,
        Qs6,
        Qs8,
        Qs9,
        Qs10,
        Qs11,
        Qs12,
        Qs13,
        Qs14,
        Qs15,
        Qs16,
        Qs17,
        Qs18,
        Qs19,
        ]
        max_count = 0
        max_disease = ""
        for key, val in self.symptom_map.items():
            count = 0
            temp_list = eval(key)
            for j in range(0, len(lis)):
                if temp_list[j] == lis[j] and lis[j] == "oui":
                    count = count + 1
            if count > max_count:
                max_count = count
                max_disease = val
        if max_disease != "":
            self.if_not_matched(max_disease)