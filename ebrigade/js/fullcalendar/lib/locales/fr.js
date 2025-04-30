FullCalendar.globalLocales.push(function () {
  'use strict';

  var fr = {
    code: 'fr',
    week: {
      dow: 1, // Monday is the first day of the week.
      doy: 4, // The week that contains Jan 4th is the first week of the year.
    },
    buttonText: {
      prev: 'Pr�c�dent',
      next: 'Suivant',
      today: "Aujourd'hui",
      year: 'Ann�e',
      month: 'Mois',
      week: 'Semaine',
      day: 'Jour',
      list: 'Planning',
    },
    weekText: 'Sem.',
    allDayText: 'Toute la journ�e',
    moreLinkText: 'en plus',
    noEventsText: 'Aucun �v�nement � afficher',
  };

  return fr;

}());
