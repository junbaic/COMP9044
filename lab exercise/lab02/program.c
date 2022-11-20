#include "stdlib.h"
#include <stddef.h>
#include "bits/types.h"

typedef int (*compar)(const void *, const void *);

#define SWAP(a, b, size)             \
	do {                             \
		size_t __size = (size);      \
		char *__a = (a), *__b = (b); \
		do {                         \
			char __tmp = *__a;       \
			*__a++ = *__b;           \
			*__b++ = __tmp;          \
		} while (--__size > 0);      \
	} while (0)

/**
 * bubble_sort_V1
 * dumb bubble sort using the stdlib::qsort interface
 * @param base       pointer to start of array to be sorted
 * @param nmemb      number of elements in array to be sorted
 * @param size       number of bytes of each element
 * @param comparator function to compare two element
 */
void bubble_sort_V1 (void *base, size_t nmemb, size_t size, compar comparator)
{
	// TODO: use better variable names.
	char *base_ptr = (char *)base;
	for (size_t loop_V1 = 0; loop_V1 < nmemb; loop_V1++) {
		for (size_t loop_V2 = 1; loop_V2 < nmemb; loop_V2++) {
			if ((*comparator)((void *)(&base_ptr[loop_V2*size]), (void *)(&base_ptr[(loop_V2-1)*size])) < 0) {
				SWAP((void *)(&base_ptr[loop_V2*size]), (void *)(&base_ptr[(loop_V2-1)*size]), size);
			}
		}
	}
}

extern int strcmp(const char *s1, const char *s2);

int cmpstringp(const void *p1, const void *p2)
{
	return strcmp(*(char *const *)p1, *(char *const *)p2);
}

int cmpintp(const void *p1, const void *p2)
{
	return (*(int *)p1 > *(int *)p2) - (*(int *)p1 < *(int *)p2);
}

extern int printf(const char *format, ...);

int main(void) {
	// Test that our bubble sort is working properly
	int array[10] = {6, 8, 3, 2, 7, 0, 100, -66, 63, 44}; // TODO: make this array bigger

	bubble_sort_V1(array, 10, sizeof(int), cmpintp);

	for (size_t i = 0; i < 10; i++) printf("%d, ", array[i]);
	printf("\n");

	return 0;
}

/**
 * selection_sort_V1
 * selection sort using the stdlib::qsort interface
 * @param base       pointer to start of array to be sorted
 * @param nmemb      number of elements in array to be sorted
 * @param size       number of bytes of each element
 * @param comparator function to compare two element
 */
void selection_sort_V1 (void *base, size_t nmemb, size_t size, compar comparator)
{
	// FIXME: implement this function.
	(void) base, (void) nmemb, (void) size, (void) comparator;
	return;
}

/**
 * insertion_sort_V1
 * insertion sort using the stdlib::qsort interface
 * @param base       pointer to start of array to be sorted
 * @param nmemb      number of elements in array to be sorted
 * @param size       number of bytes of each element
 * @param comparator function to compare two element
 */
void insertion_sort_V1 (void *base, size_t nmemb, size_t size, compar comparator)
{
	char *base_ptr = (char *)base;
	for (size_t i = 1; i < nmemb; i++) {
		while ((*comparator)((void *)(&base_ptr[i*size]), (void *)(&base_ptr[(i-1)*size])) < 0) {
			SWAP((void *)(&base_ptr[i*size]), (void *)(&base_ptr[(i-1)*size]), size);
		}
	}
}
